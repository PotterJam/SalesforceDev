trigger CategoryActionTrigger on Category_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryActionHandler.handleAfterDelete(Trigger.old);
    }
}
