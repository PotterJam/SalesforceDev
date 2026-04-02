trigger CategoryConnectorTrigger on Category_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
