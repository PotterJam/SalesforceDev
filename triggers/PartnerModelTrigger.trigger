trigger PartnerModelTrigger on Partner_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerModelHandler.handleAfterDelete(Trigger.old);
    }
}
