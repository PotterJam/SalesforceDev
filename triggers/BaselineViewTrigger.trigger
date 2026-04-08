trigger BaselineViewTrigger on Baseline_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineViewHandler.handleAfterDelete(Trigger.old);
    }
}
