trigger PhaseConnectorTrigger on Phase_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
