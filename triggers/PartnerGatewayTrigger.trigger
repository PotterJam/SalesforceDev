trigger PartnerGatewayTrigger on Partner_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
