trigger RangeSchemaTrigger on Range_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
