trigger BaselineDetailTrigger on Baseline_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineDetailHandler.handleAfterDelete(Trigger.old);
    }
}
