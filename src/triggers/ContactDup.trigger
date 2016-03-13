trigger ContactDup on Contact (before insert) {
ContactChk.ContactDup(trigger.new);
   
}