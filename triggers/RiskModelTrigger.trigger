trigger RiskModelTrigger on Risk_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskModelHandler.handleAfterDelete(Trigger.old);
    }
}
