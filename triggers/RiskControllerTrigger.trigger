trigger RiskControllerTrigger on Risk_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskControllerHandler.handleAfterDelete(Trigger.old);
    }
}
