trigger ScoreConnectorTrigger on Score_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
