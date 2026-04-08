trigger ResourceActionTrigger on Resource_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceActionHandler.handleAfterDelete(Trigger.old);
    }
}
