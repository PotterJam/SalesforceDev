trigger ScoreGatewayTrigger on Score_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
