#!/usr/bin/python
# -*- mode: python -*-

# Copyright 2015 Cisco Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DOCUMENTATION = '''
---
module: mac_pool
short_description: Create, modify or remove mac pool policy

description:
  - Allows to check if mac pool policy exists. If present, check for desired configuration. If desired config is not present, apply settings. If mac pool policy is not present, create and apply desired settings. If the desired state is 'absent', remove mac pool policy if it is currently present
 
version_added: "0.1.0"
author: 
    - "Cisco UCS Team"
    - "Pavan Koundinya"
'''

import sys
from ucsmsdk.mometa.macpool.MacpoolPool import MacpoolPool
from ucsmsdk.mometa.macpool.MacpoolBlock import MacpoolBlock
from ucsmsdk.ucshandle import UcsHandle
import json
import pickle
import ucs_login
import ucs_logout
def mac_pool(input):
	name = input['name']
	descr=input['descr']
	to=input['to']
	r_from=input['r_from']
	state = input['state']
	ip=input['ip']
	username=input['username']
	password=input['password']
	mo=""
	mo_block=""
	results = {}
	ucs_handle = pickle.loads(str(ucs_login.main(ip,username,password)))
###-------CHECK IF MO EXISTS---------------------------------

	try:
		mo = ucs_handle.query_dn("org-root/mac-pool-"+name)
		mo_block=ucs_handle.query_dn("org-root/mac-pool-"+name+"/block-"+r_from+"-"+to)
	except:
		print("Could not query children of macpool")


###----if expected state is "present"------------------------

	if state == "present":
		if mo:
			if ( mo.descr == descr ):
				if(to <> "" and r_from <> ""):
					if(mo_block):
						results['name']=name;
						results['expected'] = True;
						results['changed'] = False;
						results['present'] = True;
					else:
						#modified_mo =  MacpoolPool(parent_mo_or_dn="org-root", name=name, descr=descr)
						mo_1= MacpoolBlock(parent_mo_or_dn=mo, to=to, r_from=r_from)				
						ucs_handle.add_mo(mo,True)
						ucs_handle.commit()
						results['name']=name;
						results['present'] = True;
						results['removed'] = False;
						results['changed'] = True
				else:
					results['name']=name;
					results['expected'] = True;
					results['changed'] = False;
					results['present'] = True;						


			else:
				try:
					modified_mo =  MacpoolPool(parent_mo_or_dn="org-root", name=name, descr=descr)
					if(to <> "" and r_from <> ""):
						mo_1= MacpoolBlock(parent_mo_or_dn=modified_mo, to=to, r_from=r_from)					
					ucs_handle.add_mo(modified_mo,True)
					ucs_handle.commit()
					results['name']=name;
					results['present'] = True;
					results['removed'] = False;
					results['changed'] = True

		   		except Exception,e:
					print(e)

###----------if not, create boot policy with desired config ----------------

		else:
			try:
				mo =  MacpoolPool(parent_mo_or_dn="org-root", name=name, descr=descr)
				if(to <> "" and r_from <> ""):			
					mo_1= MacpoolBlock(parent_mo_or_dn=mo, to=to, r_from=r_from)
				ucs_handle.add_mo(mo)
				ucs_handle.commit()
				results['name']=name;
				results['present'] = False;
				results['created'] = True;
				results['changed'] = True;


			except:
				print("Mac-pool creation failed")


###------if expected state is "absent"----------------------------

	if state == "absent":

		if mo:

			try:
				ucs_handle.remove_mo(mo)
				results['name']=name;
				results['present'] = False;
				results['removed'] = True;
				ucs_handle.commit()

			except:
				print("Removal Mac-pool mo failed")

		else:
			results['name']=name;
			results['removed'] = False;
			results['present'] = False;
	ucs_handle=pickle.dumps(ucs_handle)
	ucs_logout.main(ucs_handle)
	return results
def main():
	json_input=json.loads(sys.argv[1])
	results = mac_pool(json_input)
	resultsjson=json.dumps(results)
	print(resultsjson)
	return resultsjson

if __name__ == '__main__':
    main()

