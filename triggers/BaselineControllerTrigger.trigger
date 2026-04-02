trigger BaselineControllerTrigger on Baseline_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineControllerHandler.handleAfterDelete(Trigger.old);
    }
}
