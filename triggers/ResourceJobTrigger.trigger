trigger ResourceJobTrigger on Resource_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceJobHandler.handleAfterDelete(Trigger.old);
    }
}
