trigger PartnerNodeTrigger on Partner_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerNodeHandler.handleAfterDelete(Trigger.old);
    }
}
