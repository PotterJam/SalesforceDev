trigger ResourceEventTrigger on Resource_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceEventHandler.handleAfterDelete(Trigger.old);
    }
}
