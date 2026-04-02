trigger AssignmentConnectorTrigger on Assignment_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
