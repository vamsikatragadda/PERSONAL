trigger AccException on Account (Before insert) {
  AccountCheck.AccountDuplicate(Trigger.new);
 }