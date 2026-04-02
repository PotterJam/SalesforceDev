trigger CeilingConnectorTrigger on Ceiling_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
