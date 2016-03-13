trigger Display on Contact (after delete, after insert, after update) {

if (trigger.isInsert || trigger.isUpdate)
{
for (Contact c: Trigger.new)
system.debug(c.Id);

}
}