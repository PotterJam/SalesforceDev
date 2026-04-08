trigger IndexJobTrigger on Index_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexJobHandler.handleAfterDelete(Trigger.old);
    }
}
