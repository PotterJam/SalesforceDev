trigger PartnerStreamTrigger on Partner_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerStreamHandler.handleAfterDelete(Trigger.old);
    }
}
