trigger IndexGatewayTrigger on Index_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
