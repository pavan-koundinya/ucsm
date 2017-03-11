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
module: boot_policy
short_description: Create, modify or remove boot policy 

description:
  - Allows to check if boot policy exists. If present, check for desired configuration. If desired config is not present, apply settings. If boot policy is not present, create and apply desired settings. If the desired state is 'absent', remove boot policy if it is currently present
 
version_added: "0.1.0"
author: 
    - "Cisco UCS Team"
    - "Pavan Koundinya"
'''

import sys
from ucsmsdk.mometa.lsboot.LsbootPolicy import LsbootPolicy
from ucsmsdk.mometa.lsboot.LsbootBootSecurity import LsbootBootSecurity
from ucsmsdk.mometa.lsboot.LsbootLan import LsbootLan
from ucsmsdk.mometa.lsboot.LsbootLanImagePath import LsbootLanImagePath
from ucsmsdk.mometa.lsboot.LsbootSan import LsbootSan
from ucsmsdk.ucshandle import UcsHandle
import json
import jsonpickle
import pickle
import ucs_login
import ucs_logout

try_list={}
def query_instance(input):
    ip=input['ip']
    username=input['username']
    password=input['password']
    exists=''
    temp_dict_obj={}
    ucs_handle = pickle.loads(str(ucs_login.main(ip,username,password)))
    try:
        mo = ucs_handle.query_classid("lsbootPolicy")
    except:
        print("Could not query children of org-root")
    if mo:
	count=0
	for obj in mo:
	    count=count+1
	    temp_dict_obj['name']=obj.name
	    temp_dict_obj['descr']=obj.descr
            temp_dict_obj['reboot_on_update']=obj.reboot_on_update
            temp_dict_obj['policy_owner']=obj.policy_owner
            temp_dict_obj['enforce_vnic_name']=obj.enforce_vnic_name
            temp_dict_obj['boot_mode']=obj.boot_mode
	    try_list[count]=temp_dict_obj
	    temp_dict_obj={}
    else: 
	exists=""
    ucs_handle=pickle.dumps(ucs_handle)
    ucs_logout.main(ucs_handle)
    return try_list

def main(): 
    json_input=json.loads(sys.argv[1])
    results = query_instance(json_input)
    resultsjson=json.dumps(results)
    print(resultsjson)
    try_list={}
    #return resultsjson

if __name__ == '__main__':
    main()