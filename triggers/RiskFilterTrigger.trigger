trigger RiskFilterTrigger on Risk_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskFilterHandler.handleAfterDelete(Trigger.old);
    }
}
