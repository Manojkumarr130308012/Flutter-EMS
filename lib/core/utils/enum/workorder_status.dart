enum WoStatus { New, InProgress, Stop, Completed }

WoStatus getStatusFromString(String status) {
  switch (status) {
    case "New":
      return WoStatus.New;
    case "INPRG":
      return WoStatus.InProgress;
    case "STP":
      return WoStatus.Stop;
    case "COMP":
      return WoStatus.Completed;
    default:
      return WoStatus.New;
  }
}
