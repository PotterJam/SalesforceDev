trigger PartnerFilterTrigger on Partner_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerFilterHandler.handleAfterDelete(Trigger.old);
    }
}
