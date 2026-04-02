trigger RangeGatewayTrigger on Range_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
