trigger TrainingGatewayTrigger on Training_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
