trigger PartnerTransformTrigger on Partner_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTransformHandler.handleAfterDelete(Trigger.old);
    }
}
