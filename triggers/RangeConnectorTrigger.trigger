trigger RangeConnectorTrigger on Range_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
