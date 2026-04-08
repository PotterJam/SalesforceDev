trigger PartnerSchemaTrigger on Partner_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
