trigger PartnerRequestTrigger on Partner_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerRequestHandler.handleAfterDelete(Trigger.old);
    }
}
