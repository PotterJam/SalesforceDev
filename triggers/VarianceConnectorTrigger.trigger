trigger VarianceConnectorTrigger on Variance_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
