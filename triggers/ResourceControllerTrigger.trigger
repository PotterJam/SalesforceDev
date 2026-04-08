trigger ResourceControllerTrigger on Resource_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceControllerHandler.handleAfterDelete(Trigger.old);
    }
}
