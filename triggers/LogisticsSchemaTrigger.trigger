trigger LogisticsSchemaTrigger on Logistics_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
