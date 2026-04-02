trigger FrequencyGatewayTrigger on Frequency_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
