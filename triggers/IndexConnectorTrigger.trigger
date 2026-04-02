trigger IndexConnectorTrigger on Index_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
