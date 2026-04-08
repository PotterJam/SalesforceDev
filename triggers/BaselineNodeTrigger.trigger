trigger BaselineNodeTrigger on Baseline_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineNodeHandler.handleAfterDelete(Trigger.old);
    }
}
