trigger RiskAdapterTrigger on Risk_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
