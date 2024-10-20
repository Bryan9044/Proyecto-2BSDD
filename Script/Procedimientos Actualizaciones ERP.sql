CREATE PROCEDURE AgregarExistenciasBodegaArticulo
	@CodigoBodega VARCHAR(15),
	@CodigoArticulo VARCHAR(15),
	@Existencias INT
AS
	BEGIN UPDATE BodegaArticulo
	SET Existencias = Existencias + @Existencias
	WHERE CodigoBodega = @CodigoBodega AND CodigoArticulo = @CodigoArticulo
END;
GO

CREATE PROCEDURE RestarExistenciasBodegaArticulo
    @CodigoBodega VARCHAR(15),
    @CodigoArticulo VARCHAR(15),
    @Existencias INT
AS
BEGIN
    BEGIN TRY
        DECLARE @ExistenciasActuales INT;

        SELECT @ExistenciasActuales = Existencias
        FROM BodegaArticulo
        WHERE CodigoBodega = @CodigoBodega AND CodigoArticulo = @CodigoArticulo;

        IF (@ExistenciasActuales - @Existencias) < 0
        BEGIN
            RAISERROR('No es posible restar más existencias de las disponibles. Existencias actuales: %d, Cantidad solicitada: %d.', 16, 1, @ExistenciasActuales, @Existencias);
            RETURN;
        END

        UPDATE BodegaArticulo
        SET Existencias = Existencias - @Existencias
        WHERE CodigoBodega = @CodigoBodega AND CodigoArticulo = @CodigoArticulo;

    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        
        RAISERROR('Existencias insuficientes: %s', @ErrorSeverity, @ErrorState, @ErrorMessage);
    END CATCH;
END;
GO

CREATE PROCEDURE ActualizarCliente
    @CedulaCliente VARCHAR(15),
    @NuevoNombre VARCHAR(20) = NULL,
    @NuevoCorreoElectronico VARCHAR(20) = NULL,
    @NuevoCelular VARCHAR(8) = NULL,
    @NuevoFax VARCHAR(20) = NULL,
    @NuevaZona VARCHAR(20) = NULL,
    @NuevoSector VARCHAR(20) = NULL
AS
BEGIN
    BEGIN TRY
        IF @NuevoNombre IS NOT NULL
        BEGIN
            UPDATE Cliente
            SET Nombre = @NuevoNombre
            WHERE CedulaCliente = @CedulaCliente;
        END
        IF @NuevoCorreoElectronico IS NOT NULL
        BEGIN
            UPDATE Cliente
            SET CorreoElectronico = @NuevoCorreoElectronico
            WHERE CedulaCliente = @CedulaCliente;
        END

        IF @NuevoCelular IS NOT NULL
        BEGIN
            UPDATE Cliente
            SET Celular = @NuevoCelular
            WHERE CedulaCliente = @CedulaCliente;
        END

        IF @NuevoFax IS NOT NULL
        BEGIN
            UPDATE Cliente
            SET Fax = @NuevoFax
            WHERE CedulaCliente = @CedulaCliente;
        END

        IF @NuevaZona IS NOT NULL
        BEGIN
            UPDATE Cliente
            SET Zona = @NuevaZona
            WHERE CedulaCliente = @CedulaCliente;
        END

        IF @NuevoSector IS NOT NULL
        BEGIN
            UPDATE Cliente
            SET Sector = @NuevoSector
            WHERE CedulaCliente = @CedulaCliente;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        
        RAISERROR('Error al actualizar el cliente: %s', @ErrorSeverity, @ErrorState, @ErrorMessage);
    END CATCH;
END;
GO
