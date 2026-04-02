trigger VarianceConfigTrigger on Variance_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceConfigHandler.handleAfterDelete(Trigger.old);
    }
}
