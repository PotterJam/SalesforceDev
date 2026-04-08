trigger ShiftCatalogTrigger on Shift_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
