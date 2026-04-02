trigger ProjectJobTrigger on Project_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectJobHandler.handleAfterDelete(Trigger.old);
    }
}
