trigger AlertConnectorTrigger on Alert_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
