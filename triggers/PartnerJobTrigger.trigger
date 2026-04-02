trigger PartnerJobTrigger on Partner_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerJobHandler.handleAfterDelete(Trigger.old);
    }
}
