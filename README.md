# salesforce-cli-nvim
Implementing the salesforce cli in a neovim plugin because I wanted to learn how to make nvim plugins and learn the salesforce cli.

## Installation

### prerequisites

I am assuming you are NOT using windows, because I am not testing on windows at this point since I work primarily on linux.

- jq
- telescope.nvim

### Install
Lazy:
```
'pbrentlinger/salesforce-cli-nvim'
```

## Currently Supported Commands

Nothing yet, but I should have setting default org soon, along with retreive and deploy 'this'
As well as run tests in this file since I have this code in another version of this plugin.

## Currently Working on:

### Org Commands

- [ ] Display Org details for default org  #vscodeCMD

### Code Commands

- [ ] Retrieve 'this' source from org  #vscodeCMD
- [ ] Deploy 'this' source to org #vscodeCMD #test

## Unimplemented Commands

### Org Commands

- [ ] Authorize a Development Hub org  #vscodeCMD
- [ ] Authoize org with Session ID  #vscodeCMD
- [ ] Create a Default Scratch Org  #vscodeCMD
- [ ] Delete Default org  #vscodeCMD
- [ ] Delete 'this' from project & org  #vscodeCMD
- [ ] Display Org details for default org  #vscodeCMD
- [ ] Display Org details for org...  #vscodeCMD
- [ ] List all Aliases  #vscodeCMD
- [ ] Logout from all Authorized Orgs  #vscodeCMD
- [ ] Logout from default org  #vscodeCMD
- [ ] Open default org #vscodeCMD
- [ ] Refresh Components  #vscodeCMD
- [ ] Refresh Types  #vscodeCMD
- [ ] Remove deleted and expired orgs  #vscodeCMD

### Test Commands

- [ ] Run Apex Tests #vscodeCMD
- [ ] Run Apex Test Suite  #vscodeCMD
- [ ] Run All lightning web component tests  #vscodeCMD
- [ ] Add tests to Apex test suite  #vscodeCMD
- [ ] Create Apex Test Suite  #vscodeCMD
- [ ] Create Apex Unit Test Class  #vscodeCMD
- [ ] Create Lightning Web Component Test  #vscodeCMD
- [ ] Refresh Lightning Web Component Test Explorer  #vscodeCMD
- [ ] Stop watching all Lightning Web Component Tests  #vscodeCMD


### Debug Commands

- [ ] Stop Apex Debugger Session  #vscodeCMD
- [ ] Config Apex Debug Exceptions  #vscodeCMD
- [ ] Get Apex Debug logs  #vscodeCMD
- [ ] Launch Apex Replay Debugger with latest log file  #vscodeCMD
- [ ] Turn off Apex Debug log for replay debugger #vscodeCMD
- [ ] Turn on Apex Debug log for replay debugger  #vscodeCMD
- [ ] Update Checkpoins in org #vscodeCMD

### Utility Commands

- [ ] Create Query in SOQL Builder  #vscodeCMD
- [ ] Cancel active command  #vscodeCMD
- [ ] Execute anonymous Apex with editor contents  #vscodeCMD
- [ ] Execute SOQL Query...  #vscodeCMD
- [ ] Install Package  #vscodeCMD
- [ ] List all Config Variables  #vscodeCMD
- [ ] Open Documentation  #vscodeCMD

### Code Commands

- [ ] Retrieve 'this' source from org  #vscodeCMD
- [ ] Deploy 'this' source to org #vscodeCMD
- [ ] Create Apex Class  #vscodeCMD
- [ ] Create Apex Trigger  #vscodeCMD
- [ ] Create Aura App  #vscodeCMD
- [ ] Create Aura Component  #vscodeCMD
- [ ] Create Aura Event  #vscodeCMD
- [ ] Create Aura Interface  #vscodeCMD
- [ ] Create Sample Analytical Template  #vscodeCMD
- [ ] Create Visualforce component  #vscodeCMD
- [ ] Create Visualforce Page  #vscodeCMD


### Project Commands

- [ ] Create & Setup Project for ISV Debug  #vscodeCMD
- [ ] Create Project with manifest #vscodeCMD
- [ ] Refresh SObject Definitions  #vscodeCMD

### Local Dev

- [ ] Open Local Development Server  #vscodeCMD
- [ ] Preview Component locally  #vscodeCMD
- [ ] Start local development server  #vscodeCMD
- [ ] Stop local development server  #vscodeCMD


- [ ] SLDS: Do not scope SLDS Validation to SFDX Project Files  #vscodeCMD
- [ ] SLDS: Scope SLDS Validation to SFDX Project Files #vscodeCMD
