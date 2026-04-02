trigger BaselineFilterTrigger on Baseline_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineFilterHandler.handleAfterDelete(Trigger.old);
    }
}
