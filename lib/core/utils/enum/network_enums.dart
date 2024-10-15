enum NetworkEnums {
  login('/users/signin'),
  forgotPassword('/api/users/forgotpassword'),
  workOrder('/workorder/getall'),
  dashboardWorkOrder('/workorder/search'),
  workOrderStatus('/selectlist/wostatus'),
  workOrderTask('/workordertask/getall/'),
  serviceRequest('/servicerequest/getall'),
  allLocation('/location/getall'),
  allAssets('/assets/getall'),
  assetById('/assets/getbyid/'),
  specifyById('/assettechspec/getbyassetid/'),
  assetPartsById('/assetparts/partsbyassetid/'),
  allProblems('/problems/getall/'),
  createServiceRequest("/servicerequest/create"),
  workType('/selectlist/workordertype'),
  failureClass('/failureclass/getall'),
  introOff('introOff'),
  workorderParts('/workorderparts/getall/'),
  token('token');

  final String path;
  const NetworkEnums(this.path);
}
