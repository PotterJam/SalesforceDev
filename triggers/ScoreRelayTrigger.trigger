trigger ScoreRelayTrigger on Score_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRelayHandler.handleAfterDelete(Trigger.old);
    }
}
