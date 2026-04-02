trigger TargetConnectorTrigger on Target_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
