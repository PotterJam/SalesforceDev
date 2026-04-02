trigger DeliverableConnectorTrigger on Deliverable_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
