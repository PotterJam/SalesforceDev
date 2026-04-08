trigger RiskItemTrigger on Risk_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskItemHandler.handleAfterDelete(Trigger.old);
    }
}
